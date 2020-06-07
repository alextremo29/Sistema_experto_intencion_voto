<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Respuesta;
use App\Resultado_toma;


class PreguntasController extends Controller
{
    public function getPreguntas(Request $request)
    {
    	$resultado = [];
    	$params_array = [
			'candidatura_id'=> $request["candidatura_id"],
			'periodo'       => $request["periodo"]
		];
		if (!empty($params_array)) {
			$validate = \Validator::make($params_array,[
				'candidatura_id'=> 'required|integer',
				'periodo'       =>'required'
			]);
			if ($validate->fails()) {
				$data = array(
                    'code'    => 405,
                    'status'  => 'bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                );
			} else{
				$preguntas = \DB::table('candidato_candidatura as ca')
							->join('candidatura as ct','ca.candidatura_id','=','ct.id')
							->join('propuesta as p','p.candidato_candidatura_id','=','ca.id')
							->join('ambito as a','p.ambito_id','=','a.id')
    						->join('opcion_respuesta as o','p.id','=','o.propuesta_id')
    						->join('pregunta as pr','o.pregunta_id','=','pr.id')
    						->select('a.nombre as ambito','pr.id as id_pregunta','pr.pregunta','o.id as opcion_id','p.id as id_propuesta','p.enunciado_propuesta')
    						->orderBy('pr.id')
    						->get();
    			foreach ($preguntas as $row) {
    				if (!isset($resultado[$row->ambito])) {
    					// $ambito = str_replace(' ', '_', $row->ambito);
    					$resultado[$row->ambito]["pregunta"] = $row->pregunta;
    					$resultado[$row->ambito]["id_pregunta"]=$row->id_pregunta;
    					$resultado[$row->ambito]["opciones"][$row->opcion_id]= $row->enunciado_propuesta;
    				} else{
    					$resultado[$row->ambito]["opciones"][$row->opcion_id]= $row->enunciado_propuesta;
    				}
    			}
    			$data = [
    				'code'     => 200,
    				'status'    => 'success',
    				'preguntas' => $resultado
    			];
    		}
		} else{
			$data = [
                'code'    => 400,
                'status'  => 'error',
                'message' => 'Los datos no se han enviado'
            ];
		}
		return response()->json($data,$data["code"]);
    }
    public function store(Request $request)
    {
    	$params_array =[
    		"id_persona" => $request["id_persona"],
    		"respuestas"   => json_decode($request["respuestas"],true)
    	];
    	if (!empty($params_array)) {
    		$validate = \Validator::make($params_array,[
    			'id_persona' => 'required|integer',
    			'respuestas'   => 'required'
    		]);
    		if ($validate->fails()) {
    			$data = [
    				'code'    => 405,
    				'status'  => 'Bad Request',
    				'message' => 'Data invalid',
    				'errors'  => $validate->errors()
    			];
    		} else{
	    		foreach ($params_array["respuestas"] as $value) {
		    		$respuesta = new Respuesta();
		    		$respuesta->persona_id = $params_array["id_persona"];
		    		$respuesta->opcion_respuesta_id = $value;
		    		$respuesta->toma = 1;
		    		$respuesta->save();
		    	}
		    	$this->calcularResultado($params_array["id_persona"]);
		    	$data = [
		    		'code'      => 200,
		    		'status'    => 'success',
		    		'resultado' =>$this->calcularResultado($params_array["id_persona"]),
		    		'menssage'  => 'Las respuestas se han almacenado con exito'
		    	];
    		}
    	}else{
    		$data = [
				'code'    => 400,
				'status'  => 'Error',
				'message' => 'Los datos no se han enviado'
			];
    	}
    	return response()->json($data, $data["code"]);
    }
    public function calcularResultado($id_persona)
    {
    	$candidatosResultado = [];
    	$totalRespuestas = 0;
    	$candidatos = \DB::table('respuesta as r')
						->join('opcion_respuesta as o','r.opcion_respuesta_id','=','o.id')
						->join('propuesta as p','o.propuesta_id','=','p.id')
						->join('candidato_candidatura as c','p.candidato_candidatura_id','=','c.id')
						->join('candidato as ca','c.candidato_id','=','ca.id')
						->select('c.id as candidato_id','ca.nombre')
						->get();
		foreach ($candidatos as $candidato) {
			$totalRespuestas++;
			if (!isset($candidatosResultado[$candidato->candidato_id])) {
				$candidatosResultado[$candidato->candidato_id]["nombre"] = $candidato->nombre;
				$candidatosResultado[$candidato->candidato_id]["total"] = 1;
			} else{
				$candidatosResultado[$candidato->candidato_id]["total"]++;
			}
		}
		foreach ($candidatosResultado as $candidato_id => $resultado) {
			$candidatosResultado[$candidato_id]["porcentaje"] = round(($resultado["total"]/$totalRespuestas)*100,2);
		}
		$this->storeResultado($candidatosResultado,$id_persona);
		return $candidatosResultado;
	}
	public function storeResultado($resultadoCandidatos,$id_persona)
	{
		foreach ($resultadoCandidatos as $candidato_candidatura_id => $resultado) {
			$resultadoToma = new Resultado_toma();
			$resultadoToma->persona_id = $id_persona;
			$resultadoToma->candidato_candidatura_id = $candidato_candidatura_id;
			$resultadoToma->porcentaje = $resultado["porcentaje"];
			$resultadoToma->save();
		}
	}
}

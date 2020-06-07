<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Persona;
use App\Rango_edad;
use App\Genero;

class CiudadanoController extends Controller
{
	public function getRangoEdad()
	{
		$data = array();
		$edades = Rango_edad::all();
		foreach ($edades as $edad) {
			$data[] = array(
				"id"   =>$edad->id,
				"rango"=>$edad->nombre 
			);
		}
		return response()->json($data);
	}
	public function getGenero()
	{
		$data = array();
		$generos = Genero::all();
		foreach ($generos as $genero) {
			$data[] = array(
				"id"   =>$genero->id,
				"genero"=>$genero->nombre 
			);
		}
		return response()->json($data);
	}
	public function storeCiudadno(Request $request)
	{
		$params_array = [
			'genero_id'      => $request["genero_id"],
			'rango_edad_id'  => $request["rango_edad_id"],
			'estrato_social' => $request["estrato_social"]
		];

		if (!empty($params_array)) {
			$validate = \Validator::make($params_array,[
				'genero_id'      => 'required|integer',
				'rango_edad_id'  =>'required|integer',
				'estrato_social' => 'required|integer'
			]);

			if ($validate->fails()) {
				$data = array(
                    'code'    => 405,
                    'status'  => 'bad request',
                    'message' => 'Data Invalid',
                    'errors'  => $validate->errors()
                );
			} else{
				$persona = new Persona();
				$persona->genero_id = $params_array["genero_id"];
				$persona->rango_edad_id = $params_array["rango_edad_id"];
				$persona->estrato_social = $params_array["estrato_social"];
				$persona->save();

				$data = [
					'code'      => 200,
					'status'    => "success",
					"message"   => "Se ha creado el coidadano correctamente",
					'ciudadano' => $persona
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
}

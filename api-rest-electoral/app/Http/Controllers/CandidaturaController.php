<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Candidatura;
use App\Candidato_cadidatura;

class CandidaturaController extends Controller
{
    public function getCandidatura()
    {
    	$candidaturas = Candidatura::all();
    	foreach ($candidaturas as $candidatura) {
    		$data[] = [
    			'id' => $candidatura->id,
    			'nombre' => $candidatura->nombre
    		];
    	}
    	return response()->json($data);
    }
    public function getPeriodo($candidatura_id)
    {
    	$periodos = \DB::table('candidato_candidatura')
    					->select('periodo')
    					->where('candidatura_id',$candidatura_id)
    					->distinct()
    					->get();
    	return response()->json($periodos[0]->periodo);
    }
}

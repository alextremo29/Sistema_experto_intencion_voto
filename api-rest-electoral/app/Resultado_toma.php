<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Resultado_toma extends Model
{
    protected $table ="resultado_toma";
    protected $fillable =[
    	"persona_id","candidato_candidatura_id","porcentaje"
    ];

    public function persona()
    {
    	return $this->belongsTo('App\Persona');
    }
    public function cadidatoCandidatura()
    {
    	return $this->belongsTo('App\Candidado_candidatura');
    }
}

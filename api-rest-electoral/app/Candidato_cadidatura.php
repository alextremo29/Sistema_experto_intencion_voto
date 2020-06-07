<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Candidato_cadidatura extends Model
{
    protected $table =  "candidato_candidatura";
    protected $fillable =[
    	"candidato_id", "candidatura_id", "periodo"
    ];

    public function candidatoCandidatura()
    {
    	return $this->belongsTo('App\Candidato');
    }
    public function candidaturaCandidato()
    {
    	return $this->belongsTo('App\Candidatura');
    }
    public function resultado_tomas()
    {
        return $this->hasMany('App\Resultado_toma');
    }
    public function propuestas()
    {
        return $this->hasMany('App\Propuesta');
    }
}

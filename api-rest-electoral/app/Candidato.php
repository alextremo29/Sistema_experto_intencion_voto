<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Candidato extends Model
{
    protected $table = "candidato";
    protected $fillable = [
    	"nombre", "ideologia_politiva_id"
    ];

    public function candidatoCandidaturas()
    {
    	return $this->hasMany('App\Candidato_candidatura');
    }
    public function ideologia()
    {
    	return $this->belongsTo('App\Ideologia_politica');
    }
}

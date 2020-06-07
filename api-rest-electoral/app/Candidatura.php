<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Candidatura extends Model
{
    protected $table = "candidatura";
    protected $fillable = [
    	"nombre"
    ];

    public function candidaturaCandidatos()
    {
    	return $this->hasMany('App\candidato_candidatura');
    }
}

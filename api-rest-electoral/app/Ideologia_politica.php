<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ideologia_politica extends Model
{
    protected $table ="ideologia_politica";
    protected $fillable =[
    	"nombre"
    ];

    public function candidatos()
    {
    	return $this->hasMany('App\Candidato');
    }
}

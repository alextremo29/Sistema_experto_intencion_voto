<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rango_edad extends Model
{
    protected $table = "rango_edad";
    protected $fillable = [
    	"nombre"
    ];

    public function personas()
    {
    	return $this->hasMany('App\Persona');
    }
}

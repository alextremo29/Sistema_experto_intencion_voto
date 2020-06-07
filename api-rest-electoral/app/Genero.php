<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Genero extends Model
{
    protected $table  ="genero";
    protected $fillable = [
    	"nombre"
    ];

    public function personas()
    {
    	return $this->hasMany('App\Persona');
    }
}

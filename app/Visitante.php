<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Visitante extends Model
{
    public $timestamps = false;
    protected $table = 'visitante';
    protected $fillable = ['fecha_nacimiento_visitante','genero_visitante'];
}

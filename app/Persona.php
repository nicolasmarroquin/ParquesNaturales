<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    public $timestamps = false;
    protected $table = 'persona';
    protected $fillable = ['id_persona','nombre_persona','id_usuario'];
}

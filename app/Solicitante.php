<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Solicitante extends Model
{
    public $timestamps = false;
    protected $table = 'solicitante';
    protected $primaryKey = 'id_solicitante';
    protected $fillable = ['id_solicitante','nombre solicitante','email_solicitante','fecha_nacimiento_solicitante','genero_solicitante','telefono_solicitante'];
}

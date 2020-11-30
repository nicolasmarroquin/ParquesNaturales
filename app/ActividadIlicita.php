<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ActividadIlicita extends Model
{
    public $timestamps = false;
    protected $table = 'actividad_ilicita';
    protected $fillable = ['asunto_actividad_ilicita','descripcion_actividad_ilicita','fecha_actividad_ilicita','PARQUE_NATURAL_id_parque'];
}

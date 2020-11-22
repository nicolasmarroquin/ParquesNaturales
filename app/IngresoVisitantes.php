<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class IngresoVisitantes extends Model
{
    public $timestamps = false;
    protected $table = 'ingreso_visitantes';
    protected $fillable = ['PARQUE_NATURAL_id_parque','VISITANTE_id_visitante','fecha_ingreso'];
}

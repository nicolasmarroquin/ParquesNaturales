<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SolicitudReserva extends Model
{
    public $timestamps = false;
    protected $table = 'solicitud_reserva';
    protected $fillable = ['SERVICIO_id_servicio','SOLICITANTE_id_solicitante','numero_acompañantes','inicio_reserva','fin_reserva','adelanto_reserva','ESTADO_id_estado'];
}

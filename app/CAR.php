<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CAR extends Model
{
    public $timestamps = false;
    protected $table = 'car';
    protected $fillable = ['title','start','end','cumplida','medico_experto_id_medico','observacion','diagnostico','solicitud_donacion_id_solicitud','color','atendida'];
}

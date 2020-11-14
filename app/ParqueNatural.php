<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ParqueNatural extends Model
{
    public $timestamps = false;
    protected $table = 'parquenatural';
    protected $fillable = ['nombre_parque','extension_parque','altitud_parque','temperatura_parque','estado_parque','comunidades_indigenas','ubicacion_parque','abierto_publico','servicio_auditorio','CAR_id_CAR','ESPECIES_id_num_especies','DECRETO_num_decreto','VALOR_INGRESO_id_valor_ingreso'];

}

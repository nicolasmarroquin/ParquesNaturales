<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CAR extends Model
{
    public $timestamps = false;
    protected $table = 'car';
    protected $fillable = ['nit_CAR','nombre_CAR','ubicacion_CAR','estado_CAR','DECRETO_num_decreto'];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ValorIngreso extends Model
{
    public $timestamps = false;
    protected $table = 'valor_ingreso';
    protected $fillable = ['id_valor_ingreso','valor_adultos','valor_niños'];

}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PersonaParqueNatural extends Model
{
    public $timestamps = false;
    protected $table = 'personal_parque_natural';
    protected $fillable = ['PARQUE_NATURAL_id_parque','PERSONA_id_persona'];

}

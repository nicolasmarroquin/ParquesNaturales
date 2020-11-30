<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Especies extends Model
{
    public $timestamps = false;
    protected $table = 'especies';
    protected $fillable = ['id_num_especies','num_especies_vegetales','num_especies_animales'];
}

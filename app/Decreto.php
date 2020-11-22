<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Decreto extends Model
{
    public $timestamps = false;
    protected $table = 'decreto';
    protected $fillable = ['num_decreto','fecha_decreto'];
}

<?php

namespace App\Http\Controllers;

use App\ParqueNatural;
use Illuminate\Http\Request;
use App\CAR;

class CARController extends Controller
{
    public function index()
    {


        return view('gestion-car');
    }
}
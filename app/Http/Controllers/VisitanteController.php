<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Visitante;

class VisitanteController extends Controller
{
    //
    /**
     * Muestra la página para solicitud de reservas
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        
        return view('formulario_visitante');
    }
}

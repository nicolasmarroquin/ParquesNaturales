<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ParqueNatural;

class SolicitudReservaController extends Controller
{
    /**
     * Muestra la página para solicitud de reservas
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $matchThese = ['estado_parque' => 1,
                       'abierto_publico'=>1]; 
        $parques_naturales_reservables = ParqueNatural::where($matchThese)->get();



        return view('solicitud_reserva',['parques_naturales' => $parques_naturales_reservables ]);
    }
}

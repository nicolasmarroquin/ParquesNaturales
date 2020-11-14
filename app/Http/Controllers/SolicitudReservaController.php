<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SolicitudReservaController extends Controller
{
    /**
     * Muestra la página para solicitud de reservas
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('solicitud_reserva');
    }
}

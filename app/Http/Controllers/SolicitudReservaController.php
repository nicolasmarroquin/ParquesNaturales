<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ParqueNatural;
use App\ServicioHospedaje;

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

    /**
     * Muestra la página con formulario para solicitud
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function solicitud($id_parque)
    {
        $matchThese = ['PARQUE_NATURAL_id_parque' => $id_parque ,
                       'estado_servicio'=>1]; 
        $servicios = ServicioHospedaje::where($matchThese)->get();
       
        return view('formulario_solicitud_reserva',['servicios' => $servicios ]);
    }
}

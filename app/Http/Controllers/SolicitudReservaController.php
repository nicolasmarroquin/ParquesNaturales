<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ParqueNatural;
use App\ServicioHospedaje;
use App\Solicitante;
use App\SolicitudReserva;

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

    /**
     * Afectua solicitud de reserva
     *
     */
    public function store(Request $request)
    {
        $solicitante =  array(
            'id_solicitante' => $request->identificacion,
            'nombre solicitante'=> $request->nombres,
            'email_solicitante'=> $request->email,
            'fecha_nacimiento_solicitante'=>$request->fecha_nacimiento,
            'genero_solicitante'=>$request->genero,
            'telefono_solicitante'=>$request->telefono
        ); 

        Solicitante::create($solicitante);

        $solicitud = array(
            'SERVICIO_id_servicio' => $request->servicio,
            'SOLICITANTE_id_solicitante' => $request->identificacion,
            'numero_acompañantes' => $request->cantidad_acompanantes,
            'inicio_reserva'=>$request->inicio_reserva,
            'fin_reserva'=>$request->fin_reserva,
            'ESTADO_id_estado'=>1

        );

        SolicitudReserva::create($solicitud);
       
       return response()->json(['success' => 'Solicitud realizadaa']);
     
    }
}

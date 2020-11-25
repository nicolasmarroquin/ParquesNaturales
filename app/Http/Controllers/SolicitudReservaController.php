<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ParqueNatural;
use App\PersonaParqueNatural;
use App\Persona;
use App\ServicioHospedaje;
use App\Solicitante;
use App\SolicitudReserva;
use App\Estado;
use DB;
use Auth;
use Illuminate\Database\QueryException;

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
    public function listarSolicitud()
    {
        
        $matchThesePer = ['id_usuario' => Auth::user()->id]; 
        $personas = Persona::where($matchThesePer)->get();
        $matchThesePerPN = ['PERSONA_id_persona' => $personas[0]->id_persona]; 
        $personasPN = PersonaParqueNatural::where($matchThesePerPN)->get();

        

        

        $solicitudes=DB::table('solicitud_reserva')
       ->join('solicitante', 'id_solicitante', '=', 'SOLICITANTE_id_solicitante')
       ->join('estado', 'id_estado', '=', 'ESTADO_id_estado')
        ->join('servicio_hospedaje', 'SERVICIO_id_servicio', '=', 'id_servicio')
        ->where([['PARQUE_NATURAL_id_parque',$personasPN[0]->PARQUE_NATURAL_id_parque],['ESTADO_id_estado',[1,2]]])
        
        ->get();
       // return($solicitudes);    
        return view('aprobar_solicitud',['solicitudes' => $solicitudes ]);
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
            'nombre_solicitante'=> $request->nombres,
            'email_solicitante'=> $request->email,
            'fecha_nacimiento_solicitante'=>$request->fecha_nacimiento,
            'genero_solicitante'=>$request->genero,
            'telefono_solicitante'=>$request->telefono
        );


            Solicitante::updateOrCreate(['id_solicitante'=>$request->identificacion],
            $solicitante);





        $solicitud = array(
            'SERVICIO_id_servicio' => $request->servicio,
            'SOLICITANTE_id_solicitante' => $request->identificacion,
            'numero_acompañantes' => $request->cantidad_acompanantes,
            'inicio_reserva'=>$request->inicio_reserva,
            'fin_reserva'=>$request->fin_reserva,
            'ESTADO_id_estado'=>1

        );

        $solicitud=SolicitudReserva::create($solicitud);

       return response()->json(['success' => 'Solicitud realizada con el ID: '.$solicitud->id]);

    }

    /**
     * Muestra la página con formulario para solicitud
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function consultar($id_solicitud)
    {
        $matchThese = ['id_solicitud' => $id_solicitud];
        $solicitud = SolicitudReserva::where($matchThese)->addSelect(['estado' => Estado::select('nombre_estado')
        ->whereColumn('ESTADO_id_estado', 'id_estado')
        ])->get();

       // return response()->json(['error' => 'La solicitud ingresada no existe!']);

        return view('estado_solicitud',['solicitud' => $solicitud[0] ]);
    }

    /**
     * Muestra la página con formulario para solicitud
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function buscar($id_solicitud)
    {
        $matchThese = ['id_solicitud' => $id_solicitud];
        $solicitud = SolicitudReserva::where($matchThese)->addSelect(['estado' => Estado::select('nombre_estado')
        ->whereColumn('ESTADO_id_estado', 'id_estado')
        ])->get();

        if(sizeof($solicitud)==0){
            return response()->json(['errors' => ['La solicitud ingresada no existe!']]);
        }else{
            return response()->json(['success' => 'La solicitud ingresada existe!']);
        }
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\PersonaParqueNatural;
use App\Persona;
use App\Visitante;
use App\IngresoVisitantes;
use DateTime;
use Illuminate\Support\Facades\Auth;

class VisitanteController extends Controller
{
    //PRUEBA_COMENTARIO
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

    public function guardar(Request $request){
    $userid =Auth::user()->id;
    $id_parque=$this->getidparque($userid);
    $fecha_hoy=date("Y-m-d H:i:s");
    $registro_visitante=array( 
        'fecha_nacimiento_visitante'=>$request->Fecha_naciemiento,
        'genero_visitante'=>$request->genero
    );
    $visitante=Visitante::create($registro_visitante);
    $registro_Ingresovisitante=array( 
        'PARQUE_NATURAL_id_parque'=>$id_parque,
        'VISITANTE_id_visitante'=>$visitante->id_visitante,
        'fecha_ingreso'=>$fecha_hoy
    );
    IngresoVisitantes::create($registro_Ingresovisitante);

    
    return response()->json(['success' => 'Se ha registrado el visitante']);
}

    public function getidparque($id_user){
        $matchThesePer = ['id_usuario' => $id_user]; 
        $personas = Persona::where($matchThesePer)->get();
        $matchThesePerPN = ['PERSONA_id_persona' => $personas[0]->id_persona]; 
        $personasPN = PersonaParqueNatural::where($matchThesePerPN)->get();
        
        return $personasPN[0]->PARQUE_NATURAL_id_parque; 
    }
}

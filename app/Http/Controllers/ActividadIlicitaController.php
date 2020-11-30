<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\ActividadIlicita;
use App\Persona;
use App\PersonaParqueNatural;

class ActividadIlicitaController extends Controller
{
    public function index()
    {
        
        return view('formulario_actividad_ilicita');
    }

    public function registrarActividadIlicita(Request $request)
    {

        $matchThesePer = ['id_usuario' => Auth::user()->id];
        $personas = Persona::where($matchThesePer)->get();
        $matchThesePerPN = ['PERSONA_id_persona' => $personas[0]->id_persona];
        $personasPN = PersonaParqueNatural::where($matchThesePerPN)->get();
        $fecha_hoy=date("Y-m-d");

        $actividad_ilicita =  array(
            'asunto_actividad_ilicita' => $request->asunto,
            'descripcion_actividad_ilicita' => $request->descripcion,
            'fecha_actividad_ilicita' => $fecha_hoy,
            'PARQUE_NATURAL_id_parque' => $personasPN[0]->PARQUE_NATURAL_id_parque
        );


        ActividadIlicita::create(
            $actividad_ilicita
        );




        return response()->json(['success' => 'Actividad Ilícita registrada ']);
    }
}

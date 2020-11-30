<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ParqueNatural;
use App\CAR;
use App\Decreto;
use App\Especies;
use App\ValorIngreso;
use Illuminate\Support\Facades\Auth;

class ParqueController extends Controller
{
    public function index()
    {
        $parque = ParqueNatural::get();

        //return ($parque);
        return view('gestion-parques',['parque' => $parque ]);
    }

    public function crearRegistro()
    {
        $car = CAR::get();
        return view('formulario_registro_parque',['car' => $car]);
    }

    public function crearParque(Request $request)
    {
        $decreto =  array(
            'num_decreto'=> $request->decreto,
            'fecha_decreto'=> $request->fechaDecreto
        );

        $nitCar = $request->car;

        $lastId = ParqueNatural::pluck('id_parque')->last();

        $especies = array(
            'id_num_especies' =>$lastId + 1,
            'num_especies_vegetales' => $request->espvegetales,
            'num_especies_animales'=> $request->espanimales,
        );

        $parque = array(
            'id_parque'=> $request->nit,
            'nombre_parque'=> $request->nombre,
            'extension_parque'=> $request->extension,
            'altitud_parque'=> $request->altitud,
            'temperatura_parque'=> $request->temperatura,
            'estado_parque'=> 1,
            'comunidades_indigenas'=> $request->comindigenas,
            'ubicacion_parque'=> $request->ubicacion,
            'abierto_publico'=> $request->abierto,
            'servicio_auditorio'=> $request->srvcauditorio,
            'CAR_id_CAR'=> $nitCar,
            'ESPECIES_id_num_especies'=> $lastId + 1,
            'DECRETO_num_decreto'=> $request->decreto,
            'VALOR_INGRESO_id_valor_ingreso'=> $lastId + 1
        );

        $valorIngreso = array(
            'id_valor_ingreso' => $lastId + 1,
            'valor_adultos' => $request->vingresoad,
            'valor_niños' => $request->vingresoni
        );

        Decreto::create($decreto);
        Especies::create($especies);
        ValorIngreso::create($valorIngreso);
        ParqueNatural::create($parque);

        return response()->json(['success' => 'Registro de Parque natural '.$request->nombre.' con No. de decreto '.$request->decreto.' creado exitosamente.']);
    }

    public function eliminar($id_parque)
    {

        ParqueNatural::where(['id_parque'=>$id_parque])->delete();

        return redirect()->route('/gestion-parques');
    }

}

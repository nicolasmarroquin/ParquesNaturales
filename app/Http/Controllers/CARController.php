<?php

namespace App\Http\Controllers;

use App\ParqueNatural;
use Illuminate\Http\Request;
use App\CAR;
use App\Decreto;

class CARController extends Controller
{
    public function index()
    {
        $car = CAR::get();
        //return ($car);
        return view('gestion-car',['car' => $car ]);
    }

    public function crearRegistro()
    {
        return view('formulario_registro_car');
    }

    public function crearCAR(Request $request)
    {
        $decreto =  array(
            'num_decreto'=> $request->decreto,
            'fecha_decreto'=> $request->fechaDecreto
        );

        $car =  array(
            'nit_CAR'=> $request->nit,
            'nombre_CAR'=> $request->nombre,
            'ubicacion_CAR'=> $request->ubicacion,
            'estado_CAR'=> 1 ,
            'DECRETO_num_decreto'=> $request->decreto
        );

        Decreto::create($decreto);
        CAR::create($car);

        return response()->json(['success' => 'Registro de CAR con No. de decreto '.$request->decreto.' creado exitosamente.']);
    }

    public function editarCAR()
    {//$idCar
       // $car = CAR::find($idCar);

        return view('formulario_editar_car');
    }


}

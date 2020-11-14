@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-9">
        <h1>Parques Naturales Disponibles Con Reservaciones</h1>

        <div class="row">
        @foreach ($parques_naturales as $pn )
    
    
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">{{$pn -> nombre_parque }}</h5>
                <p class="card-text">Ubicación: {{$pn -> ubicacion_parque }}</p>
            <a href='/solicitud_reserva/{{$pn -> id_parque}}' class="btn btn-primary">Solicitar reservación</a>
            </div>
        </div>
    
    
        @endforeach
        <div>
        
        </div>
    </div>
</div>
@endsection

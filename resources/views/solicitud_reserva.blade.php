@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-9">
        <h1>Parques Naturales Disponibles Con Reservaciones</h1>

        @foreach ($parques_naturales as $pn )
    
    
        <<div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">{{$pn -> parque_natural }}</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Solicitar reservación</a>
            </div>
        </div>
    
    
        @endforeach
        
        </div>
    </div>
</div>
@endsection

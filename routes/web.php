<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/solicitud-reserva', 'SolicitudReservaController@index')->name('solicitud-reserva');

Route::get('/solicitud-reserva/{id_parque}', 'SolicitudReservaController@solicitud')->name('solicitud-reserva/{id_parque}');

Route::post('solicitar', 'SolicitudReservaController@store');

Route::get('/solicitud/{id_solicitud}', 'SolicitudReservaController@consultar')->name('/solicitud/{id_solicitud}');

Route::get('/buscar-solicitud/{id_solicitud}', 'SolicitudReservaController@buscar')->name('/buscar-solicitud/{id_solicitud}');

Route::get('/gestion-car', 'CARController@index')->name('/gestion-car');

Route::get('/registrar-visita', 'VisitanteController@index')->name('/registrar-visita');

Route::post('RegistrarVisitante', 'VisitanteController@guardar')-> name('/RegistrarVisitante');

Route::get('/gestion-car/nuevo-registro', 'CARController@crearRegistro')->name('/gestion-car/nuevo-registro');

Route::post('/gestion-car/post-nuevo-registro', 'CARController@crearCAR')->name('/gestion-car/post-nuevo-registro');

Route::get('/gestion-car/formulario_editar_car/{id_car}', 'CARController@editarCAR')->name('/gestion-car/formulario_editar_car/{id_car}');

Route::get('/gestion-car/formulario_editar_car', 'CARController@editarCAR')->name('/gestion-car/formulario_editar_car');

Route::get('/aprobar-solicitud', 'SolicitudReservaController@listarSolicitud')->name('/aprobar-solicitud');

Route::get('PagoSolicitud/{id_solicitud}/{adelanto}', 'SolicitudReservaController@actualizarPago')-> name('/PagoSolicitud/{id_solicitud}/{adelanto}');

Route::get('AprobarSolicitud/{id_solicitud}', 'SolicitudReservaController@AprobarSolicitud')-> name('/AprobarSolicitud/{id_solicitud}');

Route::get('RechazarSolicitud/{id_solicitud}', 'SolicitudReservaController@RechazarSolicitud')-> name('/RechazarSolicitud/{id_solicitud}');
Route::get('/gestion-parques', 'ParqueController@index')->name('/gestion-parques');

Route::get('PagoSolicitud/{id_solicitud}/{adelanto}', 'SolicitudReservaController@actualizarPago')-> name('/PagoSolicitud/{id_solicitud}/{adelanto}');

Route::get('/gestion-parques/nuevo-registro', 'ParqueController@crearRegistro')->name('/gestion-parques/nuevo-registro');

Route::post('/gestion-parques/post-nuevo-registro', 'ParqueController@crearParque')->name('/gestion-parques/post-nuevo-registro');

Route::get('/gestion-parques/eliminar/{id_parque}','ParqueController@eliminar','/gestion-parques/eliminar/{id_parque}');

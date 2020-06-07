<?php

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

Route::get('api/rangoEdad', 'CiudadanoController@getRangoEdad');
Route::get('api/genero', 'CiudadanoController@getGenero');
Route::post('api/savePersona', 'CiudadanoController@storeCiudadno');

Route::get('api/candidaturas', 'CandidaturaController@getCandidatura');
Route::get('api/periodo/{candidatura_id}', 'CandidaturaController@getPeriodo');

Route::post('api/preguntas', 'PreguntasController@getPreguntas');
Route::post('api/storePreguntas', 'PreguntasController@store');

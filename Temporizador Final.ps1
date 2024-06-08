#variables

$fecha = Get-Date
$fecha2 = "00:00:00"

#Ingreso de datos
$nombre_evento = Read-Host "Ingrese el nombre del evento"
$evento_link = Read-Host "Ingrese el enlace del evento" #Por ejemplo 'www.google.com'
$hora_user = Read-Host "Ingrese la hora programada (H/M/S)" #Horas-Minutos-Segundos x Ej:02:30:40

#programa
while ($hora_user -ne $fecha2)

    {
      $fecha = Get-Date
      $fecha2 = $fecha.ToString('T')
      $fecha2_split = $fecha2 -split ":"
      $hora_user_split = $hora_user -split ":"
      $segundos_split = -split $fecha2_split[2]
      $horas = ($hora_user_split[0] - $fecha2_split[0])
      $suma_hora = ($hora_user_split[0] - $fecha2_split[0])
      $suma_minuto = ($hora_user_split[1] - $fecha2_split[1])
      $suma_segundos = ($hora_user_split[2] - $segundos_split[0])
      if ( $suma_minuto -lt 0)
        {
           $suma_hora = $suma_hora - 1
        }  
      if ( $suma_segundos -lt 0)
        {
            $suma_segundos = $suma_segundos + 60
            $suma_minuto = $suma_minuto - 1
        }
      if ($suma_minuto -lt 0)
        {
           $suma_minuto = $suma_minuto + 60
        }
      Write-Host "Faltan" $suma_hora : $suma_minuto : $suma_segundos " HS para que comience el evento" $nombre_evento -BackgroundColor Red -ForegroundColor White
      Wait-Event -Timeout 1
      cls
    }
Start-Process msedge $evento_link -WindowStyle Minimized
# Script PowerShell para actualizar la landing page
$file = "c:\Users\Lapto\OneDrive\Desktop\SkylerClient\wash-control\index.html"
$content = Get-Content $file -Raw

# Reemplazos principales
$replacements = @{
    # Título
    'Sistema #1 para Dueños de Autolavados' = 'Sistema de Gestión para Autolavados'
    
    # Hero principal  
    'DETÉN LAS FUGAS DE DINERO EN TU NEGOCIO' = 'MODERNIZA LA GESTIÓN DE TU AUTOLAVADO'
    'El sistema POS que blinda tu caja, automatiza tu nómina y te da el control total desde tu celular. <span class="text-white">Diseñado para eliminar el robo y maximizar ganancias.</span>' = 'Registra servicios, organiza al equipo, genera tickets y consulta los resultados del negocio desde un solo sistema.'
    'Comenzar a Ganar Más' = 'Solicitar Demostración'
    
    # Módulos
    'Nómina Blindada' = 'Gestión de Nómina'
    'Cálculos automáticos por comisión o tarifa fija. Elimina errores humanos y evita discusiones con tu personal.' = 'Cálculos automáticos por comisión o tarifa fija. Pagos precisos y transparentes para tu equipo.'
    'Cierre de Caja Flash' = 'Cierre de Caja Rápido'
    'Cierra caja en menos de 1 minuto. El sistema te dice exactamente cuánto debe haber. Cero faltantes, cero excusas.' = 'Cierra caja en menos de 1 minuto. El sistema te muestra exactamente los resultados del día.'
    
    # Features
    'Caja Blindada' = 'Control de Caja'
    'Deja de perder dinero por mala administración. Con nuestro cierre de caja, cada centavo está contabilizado.' = 'Organiza el flujo de efectivo de forma clara y ordenada. Consulta los resultados en cualquier momento.'
    'Sincronización Local' = 'Acceso en la Nube'
    'El sistema sigue funcionando aunque falle el internet. Sincronización nube automática.' = 'Accede a la información desde cualquier lugar con conexión a internet.'
    
    # Precios
    'EL SOFTWARE QUE SE PAGA SOLO' = 'INVERSIÓN INTELIGENTE PARA TU NEGOCIO'
    'Eliminar un solo error de caja al mes paga tu suscripción. Invierte en tranquilidad y control absoluto.' = 'Moderniza la operación de tu autolavado con una inversión accesible y escalable.'
    
    # CTA final
    'DEJA DE PERDER DINERO HOY MISMO' = 'MODERNIZA TU AUTOLAVADO HOY'
    'Únete a los administradores que ya están triplicando la eficiencia y eliminando los robos en sus autolavados con Hyper Bee.' = 'Únete a los propietarios de autolavados que ya modernizaron su operación con Hyperbee Solutions.'
    'Eliminar Fugas de Dinero Ahora' = 'Solicitar Demostración'
    
    # Footer
    'franquicias de autolavado más demandantes' = 'autolavados que buscan crecer y organizarse'
}

foreach ($key in $replacements.Keys) {
    $value = $replacements[$key]
    Write-Host "Reemplazando: $key"
    $content = $content -replace [regex]::Escape($key), $value
}

# Agregar constante de WhatsApp
$whatsappCode = @"

        // CONFIGURACIÓN DE WHATSAPP - PENDIENTE DE CONFIGURAR
        const WHATSAPP_NUMBER = "PENDING_CONFIG"; // Reemplazar con número real, ejemplo: "50512345678"
        const WHATSAPP_MESSAGE = encodeURIComponent("Hola, vi la plataforma de gestión para autolavados de Hyperbee Solutions y me gustaría solicitar una demostración.");
        const WHATSAPP_URL = `https://wa.me/${WHATSAPP_NUMBER}?text=${WHATSAPP_MESSAGE}`;
"@
$content = $content -replace 'const \{ useState, useEffect, useRef \} = React;', "const { useState, useEffect, useRef } = React;$whatsappCode"

# Guardar archivo
Set-Content $file $content -Encoding UTF8
Write-Host "Archivo actualizado exitosamente"

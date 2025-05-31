Add-Type -AssemblyName PresentationFramework

# Leer el XAML desde el archivo
[xml]$xaml = Get-Content -Raw -Path '.\mainmenu.xaml'
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Buscar el botón por nombre y agregarle un evento
$btnContinuar = $window.FindName("btnContinuar")
$btnContinuar.Add_Click({
    [System.Windows.MessageBox]::Show("¡Esto es una prueba!")
})

# Mostrar la ventana
$window.ShowDialog()

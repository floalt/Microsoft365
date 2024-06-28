# Grunds�tzliche Berechtigungen f�r eine neue Shared Mailbox
# author: flo.alt@fa-netz.de
# Ver 0.8
 
# Verwendung: .\make-perms -mailbox [MailboxName] -group [Gruppe]
# Beispiel: .\make-perms -mailbox einkauf -group sg-einkauf-s

param(
[string]$mailbox,
[string]$group,
)

# Sprache der Ordnernamen:

Set-MailboxRegionalConfiguration $mailbox -Language de-DE -LocalizeDefaultFolderName

# Hier werden die Schreibrechte festgelegt

Add-MailboxFolderPermission -Identity $mailbox -User $group -AccessRights PublishingEditor -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Posteingang" -User $group -AccessRights PublishingEditor -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Gesendete Elemente" -User $group -AccessRights PublishingEditor -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Gel�schte Elemente" -User $group -AccessRights PublishingEditor -Confirm:$False
Add-MailboxFolderPermission -Identity $mailbox":\Junk-E-Mail" -User $group -AccessRights PublishingEditor -Confirm:$False

# Hier Senderechte f�r group vergeben

Add-RecipientPermission -Identity $mailbox -AccessRights SendAs -Trustee $group -Confirm:$False


#### // Tutorial //

# Initial Server Setup with Ubuntu 20.04


![Initial Server Setup with Ubuntu 20.04](https://www.digitalocean.com/_next/static/media/intro-to-cloud.d49bc5f7.jpeg "Initial Server Setup with Ubuntu 20.04")

##### Not using  Ubuntu  20.04?Choose a different version or distribution.

Ubuntu 20.04

### [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#introduction)Introduction

When you first create a new Ubuntu 20.04 server, you should perform some important configuration steps as part of the initial setup. These steps will increase the security and usability of your server, and will give you a solid foundation for subsequent actions.

## [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#step-1-logging-in-as-root)Step 1 — Logging in as root

To log into your server, you will need to know your  **server’s public IP address**. You will also need the password or — if you installed an SSH key for authentication — the private key for the  **root**  user’s account. If you have not already logged into your server, you may want to follow our guide on  [how to Connect to Droplets with SSH](https://docs.digitalocean.com/products/droplets/how-to/connect-with-ssh/), which covers this process in detail.

If you are not already connected to your server, log in now as the  **root**  user using the following command (substitute the highlighted portion of the command with your server’s public IP address):

```bash
	ssh root@your_server_ip
```


Accept the warning about host authenticity if it appears. If you are using password authentication, provide your  **root**  password to log in. If you are using an SSH key that is passphrase protected, you may be prompted to enter the passphrase the first time you use the key each session. If this is your first time logging into the server with a password, you may also be prompted to change the  **root**  password.

### [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#about-root)About root

The  **root**  user is the administrative user in a Linux environment that has very broad privileges. Because of the heightened privileges of the  **root**  account, you are  _discouraged_  from using it on a regular basis. This is because the  **root**  account is able to make very destructive changes, even by accident.

The next step is setting up a new user account with reduced privileges for day-to-day use. Later, we’ll show you how to temporarily gain increased privileges for the times when you need them.

## [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#step-2-creating-a-new-user)Step 2 — Creating a New User

Once you are logged in as  **root**, you’ll be able to add the new user account. In the future, we’ll log in with this new account instead of  **root**.

This example creates a new user called  **sammy**, but you should replace that with a username that you like:

```
	adduser sammy
```

You will be asked a few questions, starting with the account password.

Enter a strong password and, optionally, fill in any of the additional information if you would like. This is not required and you can just hit  `ENTER`  in any field you wish to skip.

## [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#step-3-granting-administrative-privileges)Step 3 — Granting Administrative Privileges

Now we have a new user account with regular account privileges. However, we may sometimes need to do administrative tasks.

To avoid having to log out of our normal user and log back in as the  **root**  account, we can set up what is known as  _superuser_  or  **root**  privileges for our normal account. This will allow our normal user to run commands with administrative privileges by putting the word  `sudo`  before the command.

To add these privileges to our new user, we need to add the user to the  **sudo**  group. By default, on Ubuntu 20.04, users who are members of the  **sudo**  group are allowed to use the  `sudo`  command.

As  **root**, run this command to add your new user to the  **sudo**  group (substitute the highlighted username with your new user):

```
	usermod -aG sudo sammy
```

Now, when logged in as your regular user, you can type  `sudo`  before commands to run them with superuser privileges.

## [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#step-4-setting-up-a-basic-firewall)Step 4 — Setting Up a Basic Firewall

Ubuntu 20.04 servers can use the UFW firewall to make sure only connections to certain services are allowed. We can set up a basic firewall using this application.

**Note:**  If your servers are running on DigitalOcean, you can optionally use  [DigitalOcean Cloud Firewalls](https://docs.digitalocean.com/products/networking/firewalls/)  instead of the UFW firewall. We recommend using only one firewall at a time to avoid conflicting rules that may be difficult to debug.

Applications can register their profiles with UFW upon installation. These profiles allow UFW to manage these applications by name. OpenSSH, the service allowing us to connect to our server now, has a profile registered with UFW.

You can see this by typing:

```
ufw app list
```


We need to make sure that the firewall allows SSH connections so that we can log back in next time. We can allow these connections by typing:

```
ufw allow OpenSSH
```



Afterwards, we can enable the firewall by typing:

```
ufw enable
```

Type  `y`  and press  `ENTER`  to proceed. You can see that SSH connections are still allowed by typing:

```
ufw status
```

```

```

As  **the firewall is currently blocking all connections except for SSH**, if you install and configure additional services, you will need to adjust the firewall settings to allow traffic in. You can learn some common UFW operations in our  [_UFW Essentials_  guide](https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands).

## [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#step-5-enabling-external-access-for-your-regular-user)Step 5 — Enabling External Access for Your Regular User

Now that we have a regular user for daily use, we need to make sure we can SSH into the account directly.

**Note:**  Until verifying that you can log in and use  `sudo`  with your new user, we recommend staying logged in as  **root**. This way, if you have problems, you can troubleshoot and make any necessary changes as  **root**. If you are using a DigitalOcean Droplet and experience problems with your  **root**  SSH connection, you can  [regain access to Droplets using the Recovery Console](https://docs.digitalocean.com/products/droplets/resources/recovery-console/).

The process for configuring SSH access for your new user depends on whether your server’s  **root**  account uses a password or SSH keys for authentication.

### [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#if-the-root-account-uses-password-authentication)If the root Account Uses Password Authentication

If you logged in to your  **root**  account  _using a password_, then password authentication is  _enabled_  for SSH. You can SSH to your new user account by opening up a new terminal session and using SSH with your new username:

```

```

Copy

After entering your regular user’s password, you will be logged in. Remember, if you need to run a command with administrative privileges, type  `sudo`  before it like this:

```

```

Copy

You will be prompted for your regular user password when using  `sudo`  for the first time each session (and periodically afterwards).

To enhance your server’s security,  **we strongly recommend setting up SSH keys instead of using password authentication**. Follow our guide on  [setting up SSH keys on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04)  to learn how to configure key-based authentication.

### [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#if-the-root-account-uses-ssh-key-authentication)If the root Account Uses SSH Key Authentication

If you logged in to your  **root**  account  _using SSH keys_, then password authentication is  _disabled_  for SSH. You will need to add a copy of your local public key to the new user’s  `~/.ssh/authorized_keys`  file to log in successfully.

Since your public key is already in the  **root**  account’s  `~/.ssh/authorized_keys`  file on the server, we can copy that file and directory structure to our new user account in our existing session.

The simplest way to copy the files with the correct ownership and permissions is with the  `rsync`  command. This will copy the  **root**  user’s  `.ssh`  directory, preserve the permissions, and modify the file owners, all in a single command. Make sure to change the highlighted portions of the command below to match your regular user’s name:

**Note:**  The  `rsync`  command treats sources and destinations that end with a trailing slash differently than those without a trailing slash. When using  `rsync`  below, be sure that the source directory (`~/.ssh`)  **does not**  include a trailing slash (check to make sure you are not using  `~/.ssh/`).

If you accidentally add a trailing slash to the command,  `rsync`  will copy the  _contents_  of the  **root**  account’s  `~/.ssh`  directory to the  `sudo`  user’s home directory instead of copying the entire  `~/.ssh`  directory structure. The files will be in the wrong location and SSH will not be able to find and use them.

```

```

Copy

Now, open up a new terminal session on your local machine, and use SSH with your new username:

```

```

Copy

You should be logged in to the new user account without using a password. Remember, if you need to run a command with administrative privileges, type  `sudo`  before it like this:

```

```

Copy

You will be prompted for your regular user password when using  `sudo`  for the first time each session (and periodically afterwards).

## [](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04#where-to-go-from-here)Where To Go From Here?

At this point, you have a solid foundation for your server. You can install any of the software you need on your server now.
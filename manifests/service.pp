class lampwordpress::service inherits lampwordpress {


service {"ntp":
ensure => running,
}

service {"apache2":
ensure => running,
}

service {"mysql":
ensure => running,
}

}

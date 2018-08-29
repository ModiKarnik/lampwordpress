class lampwordpress {
    include lampwordpress::install
    include lampwordpress::wordpress
    include lampwordpress::db
    include lampwordpress::service
}

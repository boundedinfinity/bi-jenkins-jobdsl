job('myjob') {
    triggers {
        scm('*/15 * * * *')
    }
}
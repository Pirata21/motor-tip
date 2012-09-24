from bottle import route, run, debug
import controllers



debug(True)
run(host='localhost', port=8080, reloader=True)

from app import app

def test_health():
    r = app.test_client().get('/health')
    assert r.status_code == 200
    assert r.get_json() == {"status": "ok"}

def test_lots():
    r = app.test_client().get('/lots')
    assert r.status_code == 200
    assert len(r.get_json()) > 0

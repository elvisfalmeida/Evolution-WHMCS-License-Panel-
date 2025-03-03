<?php
session_start();
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: admin_login.php");
    exit;
}

require_once 'admin_header.php';
require_once __DIR__ . '/../includes/db.php';
require_once __DIR__ . '/../includes/functions.php';

// Verifica se o ID do administrador foi passado via GET (usando "id")
if (!isset($_GET['id']) || empty($_GET['id'])) {
    echo "<div class='container'><div class='alert alert-danger'>Administrador não especificado.</div>";
    echo "<a href='admin_manage.php' class='btn btn-secondary'>Voltar</a></div>";
    require_once 'admin_footer.php';
    exit;
}

$admin_id = intval($_GET['id']);

// Impede que o administrador se exclua
if ($_SESSION['admin_id'] == $admin_id) {
    echo "<div class='container'><div class='alert alert-danger'>Você não pode excluir seu próprio usuário.</div>";
    echo "<a href='admin_manage.php' class='btn btn-secondary'>Voltar</a></div>";
    require_once 'admin_footer.php';
    exit;
}

// Se o formulário for enviado, processa a exclusão
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("DELETE FROM admins WHERE id = ?");
    if ($stmt->execute([$admin_id])) {
        echo "<div class='container'><div class='alert alert-success'>Administrador excluído com sucesso.</div>";
        echo "<a href='admin_manage.php' class='btn btn-secondary'>Voltar</a></div>";
    } else {
        echo "<div class='container'><div class='alert alert-danger'>Erro ao excluir o administrador.</div>";
        echo "<a href='admin_manage.php' class='btn btn-secondary'>Voltar</a></div>";
    }
    require_once 'admin_footer.php';
    exit;
}
?>

<div class="container">
    <h3 class="mb-4">Excluir Administrador</h3>
    <div class="alert alert-warning">
        <p>Tem certeza que deseja excluir este administrador?</p>
        <p>Esta ação não pode ser desfeita.</p>
    </div>
    <form method="post">
        <input type="hidden" name="id" value="<?php echo htmlspecialchars($admin_id); ?>">
        <button type="submit" class="btn btn-danger">Sim, excluir</button>
        <a href="admin_manage.php" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

<?php require_once 'admin_footer.php'; ?>

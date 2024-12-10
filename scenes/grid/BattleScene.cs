using Godot;
using System;

public partial class BattleScene : Node2D
{
	private const int GridSizeX = 5;        // Liczba komórek w poziomie
	private const float TileSize = 64.0f;   // Rozmiar jednej komórki na siatce

	[Export] private NodePath playerPath;
	[Export] private NodePath enemyPath;

	private CharacterBody2D player;
	private CharacterBody2D enemy;

	private int selectedProjectileType = 0;
	private RandomNumberGenerator random = new RandomNumberGenerator();

	[Export] private PackedScene projectileScene;

	public override void _Ready()
	{
		player = GetNode<CharacterBody2D>("player");
		enemy = GetNode<CharacterBody2D>("enemy");
		
		random.Randomize();

		// Połączenie z timerem do strzelania
		GetNode<Timer>("Timer").Timeout += ShootProjectile;
	}

	public override void _Process(double delta)
	{
		HandlePlayerMovement();
		HandleProjectileSelection();
	}

	private void HandlePlayerMovement()
	{
		Vector2 movement = Vector2.Zero;

		if (Input.IsActionPressed("ui_left"))
		{
			movement.X -= TileSize;
		}
		if (Input.IsActionPressed("ui_right"))
		{
			movement.X += TileSize;
		}

		Vector2 newPos = player.Position + movement;
		newPos.X = Mathf.Clamp(newPos.X, 0, (GridSizeX - 1) * TileSize);
		player.Position = newPos;
	}

	private void HandleProjectileSelection()
	{
		if (Input.IsActionJustPressed("select_paper"))
		{
			selectedProjectileType = 0;  // Papier
			GD.Print("Wybrano: Papier");
		}
		else if (Input.IsActionJustPressed("select_rock"))
		{
			selectedProjectileType = 1;  // Kamień
			GD.Print("Wybrano: Kamień");
		}
		else if (Input.IsActionJustPressed("select_scissors"))
		{
			selectedProjectileType = 2;  // Nożyce
			GD.Print("Wybrano: Nożyce");
		}
	}

	private void ShootProjectile()
	{
		// Gracz strzela wybranym pociskiem
		SpawnProjectile(player, Vector2.Up, selectedProjectileType);

		// Przeciwnik strzela losowym pociskiem
		int enemyProjectileType = random.RandiRange(0, 2); // Losowy typ (0, 1 lub 2)
		SpawnProjectile(enemy, Vector2.Down, enemyProjectileType);
	}

	private void SpawnProjectile(Node2D shooter, Vector2 direction, int projectileType)
	{
		var projectile = (Projectile)projectileScene.Instantiate();
		AddChild(projectile);

		projectile.Initialize(shooter.Position, direction, projectileType);
	}
}

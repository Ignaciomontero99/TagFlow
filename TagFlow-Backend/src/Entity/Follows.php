<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;

use Doctrine\ORM\Mapping as ORM;

/**
 * Follows
 *
 * @ORM\Table(name="follows", uniqueConstraints={@ORM\UniqueConstraint(name="ux_follow", columns={"follower_id", "followed_id"})}, indexes={@ORM\Index(name="followed_id", columns={"followed_id"}), @ORM\Index(name="IDX_4B638A73AC24F853", columns={"follower_id"})})
 * @ORM\Entity
 */
class Follows
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="created_at", type="datetime", nullable=true, options={"default"="CURRENT_TIMESTAMP"})
     */
    private $createdAt = 'CURRENT_TIMESTAMP';

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="followed_id", referencedColumnName="id")
     * })
     */
    private $followed;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="follower_id", referencedColumnName="id")
     * })
     */
    private $follower;

    public function getId(): int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return DateTime|string|null
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * @param DateTime|string|null $createdAt
     */
    public function setCreatedAt($createdAt): void
    {
        $this->createdAt = $createdAt;
    }

    public function getFollowed(): Users
    {
        return $this->followed;
    }

    public function setFollowed(Users $followed): void
    {
        $this->followed = $followed;
    }

    public function getFollower(): Users
    {
        return $this->follower;
    }

    public function setFollower(Users $follower): void
    {
        $this->follower = $follower;
    }


}

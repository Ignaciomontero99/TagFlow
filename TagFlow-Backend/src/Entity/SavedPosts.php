<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;

use Doctrine\ORM\Mapping as ORM;

/**
 * SavedPosts
 *
 * @ORM\Table(name="saved_posts", uniqueConstraints={@ORM\UniqueConstraint(name="ux_saved", columns={"user_id", "post_id"})}, indexes={@ORM\Index(name="post_id", columns={"post_id"}), @ORM\Index(name="IDX_E58E61E3A76ED395", columns={"user_id"})})
 * @ORM\Entity
 */
class SavedPosts
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
     * @ORM\Column(name="saved_at", type="datetime", nullable=true, options={"default"="CURRENT_TIMESTAMP"})
     */
    private $savedAt = 'CURRENT_TIMESTAMP';

    /**
     * @var \Posts
     *
     * @ORM\ManyToOne(targetEntity="Posts")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="post_id", referencedColumnName="id")
     * })
     */
    private $post;

    /**
     * @var \Users
     *
     * @ORM\ManyToOne(targetEntity="Users")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     * })
     */
    private $user;

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
    public function getSavedAt()
    {
        return $this->savedAt;
    }

    /**
     * @param DateTime|string|null $savedAt
     */
    public function setSavedAt($savedAt): void
    {
        $this->savedAt = $savedAt;
    }

    public function getPost(): Posts
    {
        return $this->post;
    }

    public function setPost(Posts $post): void
    {
        $this->post = $post;
    }

    public function getUser(): Users
    {
        return $this->user;
    }

    public function setUser(Users $user): void
    {
        $this->user = $user;
    }
}

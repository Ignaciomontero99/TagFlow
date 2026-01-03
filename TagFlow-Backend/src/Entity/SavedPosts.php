<?php



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


}
